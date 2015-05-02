function fcn_music_start()
global music_handle;

if isempty(music_handle.back_music), return, end

if ~isplaying(music_handle.back_music)
    play(music_handle.back_music);
end

end

