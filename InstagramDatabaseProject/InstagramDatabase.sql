CREATE DATABASE ig_clone;
USE ig_clone; 

-- Users Table:

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Photos Table

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Comments Schema

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Likes Table 

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- Followers Table

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- Photo tag Table 

CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
  );
  CREATE TABLE photo_tags (
      photo_id INTEGER NOT NULL,
      tag_id INTEGER NOT NULL,
      FOREIGN KEY(photo_id) REFERENCES photos(id),
      FOREIGN KEY(tag_id) REFERENCES tags(id),
      PRIMARY KEY(photo_id, tag_id)
  );


-- Insert Statements for InstagramData.txt file

INSERT INTO users (username, created_at) VALUES


INSERT INTO photos(image_url, user_id) VALUES


INSERT INTO follows(follower_id, followee_id) VALUES


INSERT INTO comments(comment_text, user_id, photo_id) VALUES


INSERT INTO likes(user_id,photo_id) VALUES


INSERT INTO tags(tag_name) VALUES 


INSERT INTO photo_tags(photo_id, tag_id) VALUES