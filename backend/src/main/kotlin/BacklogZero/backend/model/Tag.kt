package BacklogZero.backend.model

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(name = "tags")
data class Tag(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Long = 0,

        @Column(name = "author_id")
        val authorId: Long,

        @Column(name = "name")
        val name: String,

        @Column(name = "created_timestamp")
        val createdTimestamp: LocalDateTime = LocalDateTime.now()
)