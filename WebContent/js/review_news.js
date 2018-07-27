function loadNews() {
	sendRequest("newsTitle.jsp", null, loadedNews, "GET");
}

function loadedNews() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var id = document.getElementById("id");
		id.innerHTML = str;
	}
}

window.onload = function() {
	loadNews();
}