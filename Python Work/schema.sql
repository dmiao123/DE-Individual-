
create schema game_analysis;

drop table if exists game_analysis.game cascade;
create table game_analysis.game(
    game_id         serial primary key not null,
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

drop table if exists game_analysis.developer cascade;
create table game_analysis.developer(
    developer_id    serial primary key not null,
    developer_name  varchar(100) not null,
    stock_price     float not null
);



drop table if exists game_analysis.game_developer cascade;
create table game_analysis.game_developer(
    game_id    int not null references game_analysis.game("game_id"),
    developer_id    int not null references game_analysis.developer("developer_id")
);



drop table if exists game_analysis.user_review_web cascade;
create table game_analysis.user_review_web(
    game_id                   int not null references game_analysis.game("game_id"),
    game_name                 varchar(100) not null references game_analysis.game("game_name"),
    Metascore                 int not null,
    critic_reviews	          int not null,
    user_score                int not null,
    user_score_rating_num     int not null
);




drop table if exists game_analysis.youtube cascade;
create table game_analysis.youtube(
    game_id    int not null references game_analysis.game("game_id"),
    game_name varchar(100) not null references game_analysis.game("game_name"),
    view_count    int not null,
    like_count    int not null,
    favourite_count int not null,
    comment_count   int not null
);










