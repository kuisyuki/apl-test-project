package com.example.androidtest

import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.view.LayoutInflater
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    private lateinit var statusTextView: TextView
    private val lifecycleHistory = StringBuilder()

    private fun showCustomToast(message: String) {
        val inflater = layoutInflater
        val layout = inflater.inflate(R.layout.custom_toast, null)
        val text: TextView = layout.findViewById(R.id.toast_text)
        text.text = message

        val toast = Toast(applicationContext)
        toast.duration = Toast.LENGTH_SHORT
        toast.view = layout
        toast.setGravity(Gravity.TOP or Gravity.CENTER_HORIZONTAL, 0, 100)
        toast.show()
    }

    private fun updateStatus(status: String) {
        lifecycleHistory.append(status).append("\n")
        statusTextView.text = lifecycleHistory.toString()
        Log.d("LIFECYCLE", status)
        showCustomToast(status)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        statusTextView = findViewById(R.id.statusTextView)
        findViewById<Button>(R.id.button).setOnClickListener {
            val toast = Toast.makeText(this, "Hello World", Toast.LENGTH_SHORT)
            toast.show()
        }
        updateStatus("onCreate")
    }

    override fun onStart() {
        super.onStart()
        updateStatus("onStart")
    }

    override fun onResume() {
        super.onResume()
        updateStatus("onResume")
    }

    override fun onPause() {
        super.onPause()
        updateStatus("onPause")
    }

    override fun onStop() {
        super.onStop()
        updateStatus("onStop")
    }

    override fun onDestroy() {
        super.onDestroy()
        updateStatus("onDestroy")
    }

    override fun onRestart() {
        super.onRestart()
        updateStatus("onRestart")
    }
} 