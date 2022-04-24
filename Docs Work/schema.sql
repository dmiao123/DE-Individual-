create schema game_analysis3;

drop table if exists game_analysis3.game cascade;
drop table if exists game_analysis3.developer cascade;
drop table if exists game_analysis3.user_review_web cascade;
drop table if exists game_analysis3.youtube cascade;

create table game_analysis3.game (
    game_id         serial primary key,
    game_name       varchar(100) not null,
    ranking         int not null,
    release_date    timestamp without time zone not null,
    year            int not null,
    month           varchar(100) not null,
    date_           int not null,
    num_players     varchar(100) not null,
    game_genre      varchar(100) not null,
    game_genre1     varchar(100) not null,
    game_genre2     varchar(100) not null
);


create table game_analysis3.developer (
    developer_id            serial primary key,
    game_name               varchar(100) not null,
    developer_name          varchar(100) not null
);

create table game_analysis3.game_developer (
    game_id                 int not null references game_analysis3.game("game_id"),
    developer_id            int not null references game_analysis3.developer("developer_id")
);


create table game_analysis3.user_review_web (
    user_review_web_id               serial primary key,
    game_name                        varchar(100) not null,
    metascore                        int not null,
    critic_reviews	                 int not null,
    user_score                       float,
    user_score_rating_num            float
);

create table game_analysis3.game_user_review_web (
    game_id                 int not null references game_analysis3.game("game_id"),
    user_review_web_id      int not null references game_analysis3.user_review_web("user_review_web_id")
);



create table game_analysis3.youtube (
    youtube_id       serial primary key,
    game_name        varchar(100) not null,
    view_count       int not null,
    like_count       int not null,
    favourite_count  int not null,
    comment_count    int not null
);

create table game_analysis3.game_youtube (
    game_id                 int not null references game_analysis3.game("game_id"),
    youtube_id              int not null references game_analysis3.youtube("youtube_id")
);

