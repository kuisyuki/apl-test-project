package com.example.apltest

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.appcompat.app.AppCompatActivity
import android.os.Handler
import android.os.Looper

class HomeFragment : Fragment() {

    private var title: String? = null
    private val handler = Handler(Looper.getMainLooper())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            title = it.getString(ARG_TITLE)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        (activity as? AppCompatActivity)?.supportActionBar?.title = title

        val fragmentContentTextView: TextView = view.findViewById(R.id.fragment_content_text)
        val clickMeButton: Button = view.findViewById(R.id.click_me_button)
        val helloWorldText: TextView = view.findViewById(R.id.hello_world_text)

        if (title == getString(R.string.title_home)) {
            fragmentContentTextView.text = title
            clickMeButton.visibility = View.VISIBLE
            // helloWorldTextはデフォルトでGONEなので、CLICK MEボタンが押されたときにのみVISIBLEにする

            clickMeButton.setOnClickListener {
                helloWorldText.visibility = View.VISIBLE
                handler.postDelayed({
                    helloWorldText.visibility = View.GONE
                }, 2000)
            }
        } else {
            fragmentContentTextView.text = title
            clickMeButton.visibility = View.GONE
            helloWorldText.visibility = View.GONE
        }
    }

    companion object {
        private const val ARG_TITLE = "param1"

        @JvmStatic
        fun newInstance(title: String) = HomeFragment().apply {
            arguments = Bundle().apply {
                putString(ARG_TITLE, title)
            }
        }
    }
} 