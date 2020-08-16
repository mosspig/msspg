---
layout: front.njk
---

<h1> MOSSPIG </h1>
<img src="/img/mosspig_logo.png" height=50px />

{% for post in collections.posts reversed %}
<h3><a href="{{ post.url }}">{{ post.data.pageTitle }}</a></h3>
<em>{{ post.date | date: "%Y-%m-%d" }}. </em> </br>{{ post.data.blurb }}

{% endfor %}
