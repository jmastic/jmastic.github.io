#!/bin/bash

generate_setlist_start () {
  echo "const setlist = ["
}

generate_setlist_end () {
  echo "];"
}

generate_song_block () {
  if [[ -z $3 ]]; then
    echo "{
      artist: \"$1\",
      song: \"$2\",
    },"
  else
    echo "{
      artist: \"$1\",
      song: \"$2\",
      index: $3,
    },"
  fi
}

generate_setlist () {
  subfolder=$1
  local start=$(generate_setlist_start)
  local end=$(generate_setlist_end)
  local songs=""
  songs_list=()
  DELIMITER="§"

  for file in ./$subfolder/*.md
  do
    if [[ "$file" == "./$subfolder/index.md" ]]; then
      continue
    fi

    artist_line=$(grep -im 1 "artist: " $file)
    artist=${artist_line//"artist: "/}
    artist_for_sort=${artist#"The "}
    song_line=$(grep -im 1 "song: " $file)
    song=${song_line//"song: "/}
    index_line=$(grep -im 1 "index: " $file)
    index=${index_line//"index: "/}
    index_for_sort=$(printf "%08d" "$index")

    if [[ -z "$index" ]]
    then
      song_array_item="null$DELIMITER$artist_for_sort$DELIMITER$song$DELIMITER$artist$DELIMITER$index"
    else      
      song_array_item="$index_for_sort$DELIMITER$artist_for_sort$DELIMITER$song$DELIMITER$artist$DELIMITER$index"
    fi

    songs_list+=("$song_array_item")
  done
  
  readarray -td '' sorted < <(printf '%s\0' "${songs_list[@]}" | sort -z)
  sorted_setlist=()

  for elem in "${sorted[@]}"
  do
    IFS="$DELIMITER" read -r -a song_parts <<< "$elem"
    artist="${song_parts[3]}"
    song="${song_parts[2]}"
    index=${song_parts[0]//"null"/}
    song_element=$(generate_song_block "$artist" "$song" "$index")
    sorted_setlist+=("$song_element")
  done

  readarray -td '' setlist < <(printf '%s\0' "${sorted_setlist[@]}")
  for elem in "${setlist[@]}"
  do
    songs+="$elem"
  done

  file_content="$start$songs$end"
  echo "$file_content" > "./$subfolder/setlist.js"
}

generate_setlist "song_lyrics"
generate_setlist "lyrics"
generate_setlist "candelas_shredders"
