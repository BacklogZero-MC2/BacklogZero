package BacklogZero.backend.controller

import BacklogZero.backend.model.Document
import BacklogZero.backend.model.User
import BacklogZero.backend.service.DocumentService
import BacklogZero.backend.service.UserService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/users")
class UserController(private val userService: UserService, private val documentService: DocumentService) {

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun createUser(@RequestBody user: User): User {
        return userService.createUser(user)
    }

    @GetMapping("/{id}")
    fun getUserById(@PathVariable id: Long): User {
        return userService.getUserById(id)
    }

    @PutMapping("/{id}")
    fun updateUser(@PathVariable id: Long, @RequestBody updatedUser: User): User {
        return userService.updateUser(id, updatedUser)
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteUser(@PathVariable id: Long) {
        userService.deleteUser(id)
    }

    @GetMapping("/{id}/saved/documents")
    fun getSavedDocuments(@PathVariable id: Long): List<Document> {
        return documentService.findSavedDocuments(id)
    }

    @GetMapping("/{id}/posted/documents")
    fun getPostedDocuments(@PathVariable id: Long): List<Document> {
        return documentService.findPostedDocuments(id)
    }

    @GetMapping("/{id}/feed")
    fun getFeed(@PathVariable id: Long): List<Document> {
        return documentService.getFeed()
    }

}

// spring security