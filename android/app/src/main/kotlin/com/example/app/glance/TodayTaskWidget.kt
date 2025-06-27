package com.example.app.glance

import HomeWidgetGlanceState
import HomeWidgetGlanceStateDefinition
import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.width
import androidx.glance.layout.size
import androidx.glance.state.GlanceStateDefinition
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.layout.Row
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextDecoration
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import org.json.JSONArray
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale


class TodayTaskWidget : GlanceAppWidget() {

    override val stateDefinition: GlanceStateDefinition<*>?
        get() = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent { GlanceContent(context, currentState()) }
    }

    @Composable
    private fun GlanceContent(context: Context, currentState: HomeWidgetGlanceState) {
        val prefs = currentState.preferences
        val isSubscribed = prefs.getBoolean("isSubscribed", false)
        val taskData = prefs.getString("tasks", "[]")

        // decode the JSON list of tasks into a list of TaskEntity
        val tasks = mutableListOf<TaskEntity>()
        val jsonArray = JSONArray(taskData)
        for (i in 0 until jsonArray.length()) {
            val jsonObject = jsonArray.getJSONObject(i)
            val task =
                    TaskEntity(
                            id = jsonObject.getString("id"),
                            title = jsonObject.getString("title"),
                            completed = jsonObject.optBoolean("completed", false)
                    )
            tasks.add(task)
        }

        Box(modifier = GlanceModifier.background(Color.White).fillMaxSize().padding(16.dp)) {
            Column(modifier = GlanceModifier.fillMaxSize(), verticalAlignment = Alignment.Top) {
                // Header row
                Row(
                        horizontalAlignment = Alignment.Start,
                        verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                            text = "Today",
                            style = TextStyle(fontSize = 18.sp, fontWeight = FontWeight.Bold)
                    )

                    Spacer(modifier = GlanceModifier.fillMaxWidth())

                    Text(
                            text = SimpleDateFormat("HH:mm", Locale.getDefault()).format(Date()),
                            style = TextStyle(fontSize = 12.sp, color = ColorProvider(Color.Gray))
                    )
                }

                Spacer(modifier = GlanceModifier.height(4.dp))

                when {
                    !isSubscribed -> {
                        // Premium subscription required view
                        Column(
                                modifier = GlanceModifier.fillMaxWidth(),
                                horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            // Note: You'll need to add the premium-icon to your drawable resources
                            Image(
                                    provider = ImageProvider(android.R.drawable.ic_lock_idle_lock),
                                    contentDescription = "Premium icon",
                                    modifier = GlanceModifier.size(48.dp)
                            )

                            Spacer(modifier = GlanceModifier.height(8.dp))

                            Text(
                                    text = "Premium Subscription Required",
                                    style = TextStyle(fontSize = 14.sp, color = ColorProvider(Color.Gray))
                            )
                        }
                    }
                    tasks.isEmpty() -> {
                        // Empty state view
                        Column(
                                modifier = GlanceModifier.fillMaxWidth(),
                                horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            // Note: You'll need to add the winds-icon to your drawable resources
                            Image(
                                    provider = ImageProvider(android.R.drawable.ic_menu_day),
                                    contentDescription = "Free icon",
                                    modifier = GlanceModifier.size(48.dp)
                            )

                            Spacer(modifier = GlanceModifier.height(8.dp))

                            Text(
                                    text = "You are free",
                                    style = TextStyle(fontSize = 14.sp, color = ColorProvider(Color.Gray))
                            )
                        }
                    }
                    else -> {
                        // Task list
                        val displayTasks = tasks.take(3)

                        displayTasks.forEach { task ->
                            Row(
                                    modifier =
                                            GlanceModifier.fillMaxWidth().padding(vertical = 4.dp),
                                    verticalAlignment = Alignment.CenterVertically
                            ) {
                                // Checkbox icon
                                Image(
                                        provider =
                                                ImageProvider(
                                                        if (task.completed == true)
                                                                android.R
                                                                        .drawable
                                                                        .checkbox_on_background
                                                        else
                                                                android.R
                                                                        .drawable
                                                                        .checkbox_off_background
                                                ),
                                        contentDescription =
                                                if (task.completed == true) "Completed"
                                                else "Not completed",
                                        modifier = GlanceModifier.size(14.dp)
                                )

                                Spacer(modifier = GlanceModifier.width(8.dp))

                                // Task title
                                Text(
                                        text = task.title,
                                        style =
                                                TextStyle(
                                                        fontSize = 14.sp,
                                                        color =
                                                                if (task.completed == true)
                                                                    ColorProvider(Color.Gray)
                                                                else ColorProvider(Color.Black),
                                                        textDecoration =
                                                                if (task.completed == true)
                                                                        TextDecoration.LineThrough
                                                                else TextDecoration.None
                                                ),
                                        maxLines = 1
                                )
                            }
                        }

                        // Show remaining tasks count if more than 3
                        if (tasks.size > 3) {
                            Spacer(modifier = GlanceModifier.height(8.dp))

                            Text(
                                    text = "+ ${tasks.size - 3} autres tâches",
                                    style = TextStyle(fontSize = 12.sp, color = ColorProvider(Color.Gray))
                            )
                        }
                    }
                }
            }
        }
    }
}

data class TaskEntity(val id: String, val title: String, val completed: Boolean?)
