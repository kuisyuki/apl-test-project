package com.example.apltest

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.appcompat.widget.Toolbar

class NotificationListFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_notification_list, container, false)

        // ツールバーの設定と戻るボタンのリスナー設定
        val toolbar: Toolbar = view.findViewById(R.id.toolbar_notification_list)
        toolbar.setNavigationOnClickListener {
            // Fragmentをバックスタックからポップして前の画面に戻る
            parentFragmentManager.popBackStack()
        }

        return view
    }
} 