CREATE EXTENSION pg_trgm;
CREATE EXTENSION btree_gin;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    created_timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);
CREATE INDEX idx_users_id ON users USING HASH (id);
CREATE INDEX idx_users_username_gin ON users USING GIN (username);
CREATE INDEX idx_users_email ON users USING HASH (email);
CREATE INDEX idx_users_created_timestamp ON users (created_timestamp);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES users (id) NOT NULL,
    "name" TEXT NOT NULL,
    created_timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);
CREATE INDEX idx_tags_id ON tags USING HASH (id);
CREATE INDEX idx_tags_author_id ON tags USING HASH (author_id);
CREATE INDEX idx_tags_name_gin ON tags USING GIN ("name");
CREATE INDEX idx_tags_created_timestamp ON tags (created_timestamp);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    parent_comment_id INTEGER REFERENCES comments (id) ON DELETE CASCADE,
    author_id INTEGER REFERENCES users (id) NOT NULL ON DELETE CASCADE,
    "text" TEXT NOT NULL,
    created_timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);
CREATE INDEX idx_comments_id ON comments USING HASH (id);
CREATE INDEX idx_comments_parent_comment_id ON comments USING HASH (parent_comment_id);
CREATE INDEX idx_comments_author_id ON comments USING HASH (author_id);
CREATE INDEX idx_comments_created_timestamp ON comments (created_timestamp);

CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES users (id) NOT NULL,
    tag_id INTEGER REFERENCES tags (id) NOT NULL,
    root_dummy_comment_id INTEGER REFERENCES comments (id) UNIQUE NOT NULL,
    title TEXT NOT NULL,
    searchable_text TEXT NOT NULL,
    "url" TEXT UNIQUE NOT NULL,
    num_of_upvotes INTEGER NOT NULL,
    num_of_downvotes INTEGER NOT NULL,
    created_timestamp TIMESTAMP NOT NULL,
    last_updated_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    popularity_approx DOUBLE PRECISION GENERATED ALWAYS AS (ln((num_of_upvotes * num_of_upvotes + 1)::float / (num_of_upvotes + num_of_downvotes + 1)) + (EXTRACT(EPOCH FROM created_timestamp)::float/60/60/24/7)) STORED
);
CREATE INDEX idx_documnets_id ON documents USING HASH (id);
CREATE INDEX idx_documnets_author_id ON documents USING HASH (author_id);
CREATE INDEX idx_documnets_tag_id ON documents USING HASH (tag_id);
CREATE INDEX idx_documnets_root_dummy_comment_id ON documents USING HASH (root_dummy_comment_id);
CREATE INDEX idx_documnets_title_gin ON documents USING GIN (title);
CREATE INDEX idx_documnets_searchable_text_gin ON documents USING GIN (searchable_text);
CREATE INDEX idx_documents_popularity_approx ON documents (popularity_approx);
CREATE INDEX idx_documnets_creation_timestamp ON documents (created_timestamp);
CREATE INDEX idx_documnets_last_update_timestamp ON documents (last_updated_timestamp);

CREATE TABLE quizzes (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES users (id) NOT NULL,
    tag_id INTEGER REFERENCES tags (id) NOT NULL,
    root_dummy_comment_id INTEGER REFERENCES comments (id) UNIQUE NOT NULL,
    title TEXT NOT NULL,
    "description" TEXT NOT NULL,
    created_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    last_updated_timestamp TIMESTAMP WITH TIME ZONE NOT NULL
)
CREATE INDEX idx_quizzes_id ON quizzes USING HASH (id);
CREATE INDEX idx_quizzes_author_id ON quizzes USING HASH (author_id);
CREATE INDEX idx_quizzes_tag_id ON quizzes USING HASH (tag_id);
CREATE INDEX idx_quizzes_root_dummy_comment_id ON quizzes USING HASH (root_dummy_comment_id);
CREATE INDEX idx_quizzes_created_timestamp ON quizzes (created_timestamp);
CREATE INDEX idx_quizzes_last_updated_timestamp ON quizzes (last_updated_timestamp);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    quiz_id INTEGER REFERENCES quizzes (id) NOT NULL ON DELETE CASCADE,
    order INTEGER NOT NULL,
    question_text TEXT NOT NULL,
)
CREATE INDEX idx_questions_id ON questions USING HASH (id);
CREATE INDEX idx_questions_quiz_id ON questions USING HASH (quiz_id);
CREATE INDEX idx_questions_order ON questions (order);

CREATE TABLE answers (
    question_id INTEGER REFERENCES questions (id) NOT NULL ON DELETE CASCADE,
    order INTEGER NOT NULL,
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    PRIMARY KEY (question_id, order)
)
CREATE INDEX idx_answers_question_id ON answers USING HASH (question_id);

CREATE TABLE users_saved_documents (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    document_id INTEGER NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
    saved_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (user_id, document_id)
);
CREATE INDEX idx_users_saved_documents_user_id ON users_saved_documents USING HASH (user_id);
CREATE INDEX idx_users_saved_documents_document_id ON users_saved_documents USING HASH (document_id);
CREATE INDEX idx_users_saved_documents_saved_timestamp ON users_saved_documents (saved_timestamp);

CREATE TABLE votes (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    document_id INTEGER NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
    is_downvote BOOLEAN NOT NULL,
    voted_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (user_id, document_id)
);
CREATE INDEX idx_votes_user_id ON votes USING HASH (user_id);
CREATE INDEX idx_votes_document_id ON votes USING HASH (document_id);
CREATE INDEX idx_votes_voted_timestamp ON votes (voted_timestamp);

CREATE TABLE users_follow_tags (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    followed_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (user_id, tag_id)
);
CREATE INDEX idx_users_follow_tags_user_id ON users_follow_tags USING HASH (user_id);
CREATE INDEX idx_users_follow_tags_tag_id ON users_follow_tags USING HASH (tag_id);
CREATE INDEX idx_users_follow_tags_followed_timestamp ON users_follow_tags (followed_timestamp);

CREATE TABLE users_follow_users (
    follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    followee_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    followed_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (follower_id, followee_id)
);
CREATE INDEX idx_users_follow_users_follower_id ON users_follow_users USING HASH (follower_id);
CREATE INDEX idx_users_follow_users_followee_id ON users_follow_users USING HASH (followee_id);
CREATE INDEX idx_users_follow_users_followed_timestamp ON users_follow_users (followed_timestamp);

CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(id),
    created_timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);
CREATE INDEX idx_collections_id ON collections USING HASH (id);
CREATE INDEX idx_collections_name_gin ON collections USING GIN ("name");
CREATE INDEX idx_collections_user_id ON collections USING HASH (user_id);
CREATE INDEX idx_collections_created_timestamp ON collections (created_timestamp);

CREATE TABLE collections_contain_documents (
    collection_id INTEGER NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
    document_id INTEGER NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
    added_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (collection_id, document_id)
);
CREATE INDEX idx_collections_contain_documents_collection_id ON collections_contain_documents USING HASH (collection_id);
CREATE INDEX idx_collections_contain_documents_document_id ON collections_contain_documents USING HASH (document_id);
CREATE INDEX idx_collections_contain_documents_added_timestamp ON collections_contain_documents (added_timestamp);

CREATE TABLE users_follow_collections (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    collection_id INTEGER NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
    followed_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    PRIMARY KEY (user_id, collection_id)
);
CREATE INDEX idx_users_follow_collections_user_id ON users_follow_collections USING HASH (user_id);
CREATE INDEX idx_users_follow_collections_collection_id ON users_follow_collections USING HASH (collection_id);
CREATE INDEX idx_users_follow_collections_followed_timestamp ON users_follow_collections (followed_timestamp);


CREATE VIEW documents_view AS
SELECT *,
((num_of_upvotes * num_of_upvotes + 1)::float / (num_of_upvotes + num_of_downvotes + 1) / EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - created_timestamp)))
as popularity
FROM documents;