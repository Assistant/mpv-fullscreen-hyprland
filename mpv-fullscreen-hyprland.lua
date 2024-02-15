function toggle_fullscreen_hyprland()
    mp.command_native_async({
        name = "subprocess",
        playback_only = false,
        capture_stdout = true,
        args = { "hyprctl", "dispatch", "fullscreen", "toggle" },
    })
    mp.commandv("cycle", "fullscreen")
end

function on_focused_change(name, value)
    if value == true then
        mp.register_script_message("toggle_fullscreen_hyprland", toggle_fullscreen_hyprland)
    else
        mp.unregister_script_message("toggle_fullscreen_hyprland")
    end
end

mp.observe_property("focused", "bool", on_focused_change)
