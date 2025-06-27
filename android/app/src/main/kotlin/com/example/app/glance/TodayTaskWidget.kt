package com.example.app.glance

import HomeWidgetGlanceState
import HomeWidgetGlanceStateDefinition
import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.state.GlanceStateDefinition
import androidx.glance.text.Text
import org.json.JSONArray

class TodayTaskWidget : GlanceAppWidget() {

    override val stateDefinition: GlanceStateDefinition<*>?
        get() = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent { GlanceContent(context, currentState()) }
    }

    @Composable
    private fun GlanceContent(context: Context, currentState: HomeWidgetGlanceState) {
        val prefs = currentState.preferences
        val isSubscribed = prefs.getBoolean("isSubscribed", false);
        val taskData = prefs.getString("tasks", "[]");
        // decode the JSON list of tasks into a list of Taskentity
        val tasks = mutableListOf<TaskEntity>()
        val jsonArray = JSONArray(taskData)
        for (i in 0 until jsonArray.length()) {
            val jsonObject = jsonArray.getJSONObject(i)
            val task = TaskEntity(
                id = jsonObject.getString("id"),
                title = jsonObject.getString("title"),
                completed = jsonObject.getBoolean("completed")
            )
            tasks.add(task)
        }
        Box(
            modifier = GlanceModifier.background(Color.White).fillMaxSize().padding(16.dp)
        ) {
            Column() {
                
            }
        }
    }
}

class TaskEntity(
    id: String,
    title: String,
    completed: Boolean?
)
