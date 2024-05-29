package BacklogZero.backend.repository

import BacklogZero.backend.model.Document
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import java.sql.ResultSet

@Repository
class DocumentRepositoryImpl(
        private val jdbcTemplate: JdbcTemplate
) {
    companion object {
        private const val FIND_SAVED_DOCUMENTS = """
            SELECT d.*
            FROM documents as d
            JOIN users_saved_documents as jd ON jd.document_id = d.id
            JOIN users as u ON u.id = jd.user_id
            WHERE u.id = ?
            ;
        """
        private const val FIND_POSTED_DOCUMENTS = """
            SELECT d.*
            FROM documents as d
            WHERE d.author_id = ?
            ;
        """
        private const val GET_FEED = """
            SELECT *
            FROM (
            SELECT *
            FROM documents_view
            SORT BY popularity_approx DESC
            LIMIT 500
            )
            SORT BY popularity DESC
            LIMIT 100
            ;
        """
    }

    fun findSavedDocuments(userID: Long): List<Document> {
        return jdbcTemplate.query(FIND_SAVED_DOCUMENTS, arrayOf(userID)) { rs, _ ->
            mapResultSetToDocument(rs)
        }
    }

    fun findPostedDocuments(userID: Long): List<Document> {
        return jdbcTemplate.query(FIND_POSTED_DOCUMENTS, arrayOf(userID)) { rs, _ ->
            mapResultSetToDocument(rs)
        }
    }

    fun getFeed(): List<Document> {
        return jdbcTemplate.query(GET_FEED) { rs, _ ->
            mapResultSetToDocument(rs)
        }
    }

    fun findDocumentsByCustomQuery(customQuery: String): List<Document> {
        return jdbcTemplate.query(customQuery) { rs, _ ->
            mapResultSetToDocument(rs)
        }
    }

    private fun mapResultSetToDocument(rs: ResultSet): Document {
        return Document(
                id = rs.getLong("id"),
                authorId = rs.getLong("author_id"),
                tagId = rs.getLong("tag_id"),
                title = rs.getString("title"),
                searchableText = rs.getString("searchable_text"),
                url = rs.getString("url"),
                numOfUpvotes = rs.getInt("num_of_upvotes"),
                numOfDownvotes = rs.getInt("num_of_downvotes"),
                createdTimestamp = rs.getTimestamp("created_timestamp").toLocalDateTime(),
                lastUpdatedTimestamp = rs.getTimestamp("last_updated_timestamp").toLocalDateTime(),
                popularityApprox = rs.getDouble("popularity_approx")
        )
    }
}