package com.example.apltest

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.fragment.app.Fragment
import com.example.apltest.R

class HomeFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_home, container, false)
        val button = view.findViewById<Button>(R.id.button)
        button.setOnClickListener {
            val toastLayout = layoutInflater.inflate(R.layout.custom_toast, null)
            val toastText = toastLayout.findViewById<android.widget.TextView>(R.id.toast_text)
            toastText.text = "Hello World"
            val toast = android.widget.Toast(requireContext())
            toast.view = toastLayout
            toast.duration = android.widget.Toast.LENGTH_SHORT
            toast.setGravity(android.view.Gravity.BOTTOM or android.view.Gravity.CENTER_HORIZONTAL, 0, 120)
            toast.show()
        }
        return view
    }
} 