function fcn_music_stop()
global music_handle;
if isempty(music_handle.back_music), return, end

if isplaying(music_handle.back_music)
    stop(music_handle.back_music);
end
end
