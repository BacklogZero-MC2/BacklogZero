package BacklogZero.backend.model

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(name = "users")
data class User(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Long = 0,

        @Column(name = "username")
        val username: String,

        @Column(name = "email")
        val email: String,

        @Column(name = "password")
        val password: String,

        @Column(name = "created_timestamp")
        val createdTimestamp: LocalDateTime = LocalDateTime.now()
)

