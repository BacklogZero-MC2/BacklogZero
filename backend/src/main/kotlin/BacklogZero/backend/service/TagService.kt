package BacklogZero.backend.service

import BacklogZero.backend.model.Tag
import BacklogZero.backend.repository.TagRepository
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Service
import org.springframework.web.server.ResponseStatusException

@Service
class TagService(private val tagRepository: TagRepository) {

    fun createTag(tag: Tag): Tag {
        return tagRepository.save(tag)
    }

    fun getTagById(id: Long): Tag {
        return tagRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "Tag with ID $id not found")
        }
    }

    fun updateTag(id: Long, updatedTag: Tag): Tag {
        val existingTag = tagRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "Tag with ID $id not found")
        }

        updatedTag.id = existingTag.id // Ensure ID is preserved
        return tagRepository.save(updatedTag)
    }

    fun deleteTag(id: Long) {
        if (!tagRepository.existsById(id)) {
            throw ResponseStatusException(HttpStatus.NOT_FOUND, "Tag with ID $id not found")
        }
        tagRepository.deleteById(id)
    }

}