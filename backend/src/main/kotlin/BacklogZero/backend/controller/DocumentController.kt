package BacklogZero.backend.controller

import BacklogZero.backend.model.Document
import BacklogZero.backend.service.DocumentService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/documents")
class DocumentController(private val documentService: DocumentService) {

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun createDocument(@RequestBody document: Document): Document {
        return documentService.createDocument(document)
    }

    @GetMapping("/{id}")
    fun getDocumentById(@PathVariable id: Long): Document {
        return documentService.getDocumentById(id)
    }

    @PutMapping("/{id}")
    fun updateDocument(@PathVariable id: Long, @RequestBody updatedDocument: Document): Document {
        return documentService.updateDocument(id, updatedDocument)
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteDocument(@PathVariable id: Long) {
        documentService.deleteDocument(id)
    }

}