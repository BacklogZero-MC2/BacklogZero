package BacklogZero.backend.model

import jakarta.persistence.*
import java.sql.ResultSet
import java.time.LocalDateTime
import kotlin.jvm.Transient

@Entity
@Table(name = "documents")
data class Document(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Long = 0,

        @Column(name = "author_id")
        val authorId: Long,

        @Column(name = "tag_id")
        val tagId: Long,

        @Column(name = "title")
        val title: String,

        @Column(name = "searchable_text")
        val searchableText: String,

        @Column(name = "url")
        val url: String,

        @Column(name = "num_of_upvotes")
        val numOfUpvotes: Int = 0,

        @Column(name = "num_of_downvotes")
        val numOfDownvotes: Int = 0,

        @Column(name = "created_timestamp")
        val createdTimestamp: LocalDateTime,

        @Column(name = "last_updated_timestamp")
        val lastUpdatedTimestamp: LocalDateTime,

        @Transient
        val popularityApprox: Double
)