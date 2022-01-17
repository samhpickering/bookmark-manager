# Bookmark-Manager

    As a user
    so that I can revisit pages I like
    I can see a list of bookmarks

![Sequence diagram](diagram.png "Domain model diagram")

    alias client="Client"
    alias controller="Controller"
    alias view="View"
    alias model="Model"
    alias database="Database"

    client->controller: "GET /bookmarks"
    controller->model: "all bookmarks"
    model->database: "all bookmarks"
    database->model: "bookmark data"
    model->controller: "bookmark instances"
    controller->view: "bookmark instances"
    view->controller: "bookmarks page (HTML)"
    controller->client: "bookmarks page (HTML)"