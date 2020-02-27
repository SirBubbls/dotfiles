function downscale
    rm -r ./downscaled;
    mkdir downscaled;
    set x (ffmpeg -i (ls | grep -m1 .mp4) -t 1 -vf cropdetect=16:16:0 -f null - 2>&1 | awk '/crop/ { print $NF }' | tail -1);
    for file in *.mp4
        # set x (ffmpeg -i "$file" -t 1 -vf cropdetect=18:16:0 -f null - 2>&1 | awk '/crop/ { print $NF }' | tail -1);
        echo $x;
        echo "Converting File $file";
        ffmpeg -i "$file" -s 720x480 -ac 1 -preset veryfast -vf $x downscaled/$file;
    end
end
