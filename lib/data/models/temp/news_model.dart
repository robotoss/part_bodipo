// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    NewsModel({
        this.userName,
        this.postDate,
        this.title,
        this.data,
        this.likes,
        this.comments,
        this.images,
    });

    String userName;
    String postDate;
    String title;
    String data;
    int likes;
    List<Comment> comments;
    List<String> images;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        userName: json["user_name"],
        postDate: json["post_date"],
        title: json["title"],
        data: json["data"],
        likes: json["likes"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "post_date": postDate,
        "title": title,
        "data": data,
        "likes": likes,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Comment {
    Comment({
        this.author,
        this.cooment,
    });

    String author;
    String cooment;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        author: json["author"],
        cooment: json["cooment"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "cooment": cooment,
    };
}
