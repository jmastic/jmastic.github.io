---
layout: lyric_home
title: All Songs
---

<script type="text/javascript" src="./setlist.js"></script>

<script>
  const sortedSetlist = setlist.sort((a, b) => {
    const indexComparison = a.index ?? 9999999 - b.index ?? 9999999;
    if (indexComparison !== 0) {
      return indexComparison;
    }
    
    const artistComparison = a.artist.localeCompare(b.artist);
    if (artistComparison !== 0) {
      return artistComparison;
    }
    
    const songComparison = a.song.localeCompare(b.song);
    if (songComparison !== 0) {
      return songComparison;
    }
    return 0;
  });

  const formatLinkDestination = (item) => {
    return `./${item.artist.toLowerCase().replaceAll(" ", "_")}_${item.song
      .toLowerCase()
      .replaceAll(" ", "_")
      .replaceAll(",", "")}`;
  };

  const linkTemplate = (item) => {
    const link = document.createElement("a");
    link.href = formatLinkDestination(item);
    link.textContent = `${item.artist} - ${item.song}`;

    const wrapper = document.createElement("p");
    wrapper.appendChild(link);

    return wrapper;
  };

  $(function () {
    sortedSetlist.map((item) => {
      document.querySelector("#SetList").append(linkTemplate(item));
    });
  });
</script>

<h3 style="text-align:center;font-style:italic;">Candelas Shredders</h3>

<div id="SetList"></div>
