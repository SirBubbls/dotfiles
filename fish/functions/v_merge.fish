function v_merge
    rm files.txt
    for file in *.mp4
        echo "file '$file'" >> files.txt
    end
    ffmpeg -f concat -i files.txt -c copy concat.mp4 -copytb 1
end
