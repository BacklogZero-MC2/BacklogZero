package BacklogZero.backend.service

import BacklogZero.backend.model.User
import BacklogZero.backend.repository.UserRepository
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Service
import org.springframework.web.server.ResponseStatusException

@Service
class UserService(private val userRepository: UserRepository) {

    fun createUser(user: User): User {
        return userRepository.save(user)
    }

    fun getUserById(id: Long): User {
        return userRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "User with ID $id not found")
        }
    }

    fun updateUser(id: Long, updatedUser: User): User {
        val existingUser = userRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "User with ID $id not found")
        }

        val updatedUser2 = updatedUser.copy(id = existingUser.id)
        return userRepository.save(updatedUser2)
    }

    fun deleteUser(id: Long) {
        if (!userRepository.existsById(id)) {
            throw ResponseStatusException(HttpStatus.NOT_FOUND, "User with ID $id not found")
        }
        userRepository.deleteById(id)
    }

}