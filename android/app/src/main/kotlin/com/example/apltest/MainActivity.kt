package com.example.apltest

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import androidx.core.view.GravityCompat
import androidx.drawerlayout.widget.DrawerLayout
import androidx.fragment.app.Fragment
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView
import android.graphics.Color

class MainActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {
    private lateinit var bottomNavigation: BottomNavigationView
    private lateinit var drawerLayout: DrawerLayout
    private lateinit var navigationView: NavigationView
    private lateinit var toolbar: Toolbar

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        bottomNavigation = findViewById(R.id.bottom_navigation)

        // Toolbarの設定
        toolbar = findViewById(R.id.toolbar)
        setSupportActionBar(toolbar)
        toolbar.setTitleTextColor(Color.BLACK)

        // DrawerLayoutの設定
        drawerLayout = findViewById(R.id.drawer_layout)
        navigationView = findViewById(R.id.nav_view)
        navigationView.setNavigationItemSelectedListener(this)

        // ActionBarDrawerToggleの設定
        val toggle = ActionBarDrawerToggle(
            this,
            drawerLayout,
            toolbar,
            R.string.navigation_drawer_open,
            R.string.navigation_drawer_close
        )
        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

        // 初期表示はHomeFragment
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(R.id.fragment_container, HomeFragment.newInstance(getString(R.string.title_home)))
                .commit()
        }

        bottomNavigation.setOnItemSelectedListener { item ->
            val fragment: Fragment = when (item.itemId) {
                R.id.navigation_home -> HomeFragment.newInstance(getString(R.string.title_home))
                R.id.navigation_coupon -> CouponFragment.newInstance(getString(R.string.title_coupon))
                R.id.navigation_card -> CardFragment.newInstance(getString(R.string.title_card))
                R.id.navigation_save -> SaveFragment.newInstance(getString(R.string.title_save))
                R.id.navigation_use -> PontaServiceFragment.newInstance(getString(R.string.title_use))
                else -> HomeFragment.newInstance(getString(R.string.title_home))
            }
            supportFragmentManager.beginTransaction()
                .replace(R.id.fragment_container, fragment)
                .commit()
            true
        }
    }

    // ツールバーにメニューを表示
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.main_menu, menu)
        return true
    }

    // メニュー項目が選択された時の処理
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.action_notifications -> {
                // お知らせアイコンがタップされた時の処理
                supportFragmentManager.beginTransaction()
                    .replace(R.id.fragment_container, NotificationListFragment())
                    .addToBackStack(null) // バックスタックに追加して戻れるようにする
                    .commit()
                return true
            }
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.nav_settings -> {
                // 設定画面への遷移処理
            }
            R.id.nav_help -> {
                // ヘルプ画面への遷移処理
            }
            R.id.nav_contact -> {
                // お問い合わせ画面への遷移処理
            }
        }
        drawerLayout.closeDrawer(GravityCompat.START)
        return true
    }

    override fun onBackPressed() {
        if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START)
        } else {
            super.onBackPressed()
        }
    }
} 