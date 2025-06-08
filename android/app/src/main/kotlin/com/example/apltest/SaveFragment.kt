package com.example.apltest

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class SaveFragment : Fragment() {

    private var title: String? = null

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
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_save, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // 親アクティビティのツールバータイトルを設定
        (activity as? AppCompatActivity)?.supportActionBar?.title = title

        val fragmentSaveTextView: TextView = view.findViewById(R.id.fragment_save_text)
        fragmentSaveTextView.text = "ためるサービス"
    }

    companion object {
        private const val ARG_TITLE = "param1"

        @JvmStatic
        fun newInstance(title: String) = SaveFragment().apply {
            arguments = Bundle().apply {
                putString(ARG_TITLE, title)
            }
        }
    }
} 