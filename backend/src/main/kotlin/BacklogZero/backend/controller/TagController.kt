package BacklogZero.backend.controller

import BacklogZero.backend.model.Tag
import BacklogZero.backend.service.TagService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/tags")
class TagController(private val tagService: TagService) {

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun createTag(@RequestBody tag: Tag): Tag {
        return tagService.createTag(tag)
    }

    @GetMapping("/{id}")
    fun getTagById(@PathVariable id: Long): Tag {
        return tagService.getTagById(id)
    }

    @PutMapping("/{id}")
    fun updateTag(@PathVariable id: Long, @RequestBody updatedTag: Tag): Tag {
        return tagService.updateTag(id, updatedTag)
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteTag(@PathVariable id: Long) {
        tagService.deleteTag(id)
    }

}