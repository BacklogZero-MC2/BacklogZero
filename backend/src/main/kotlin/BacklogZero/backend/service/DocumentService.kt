package BacklogZero.backend.service

import BacklogZero.backend.model.Document
import BacklogZero.backend.repository.DocumentRepository
import BacklogZero.backend.repository.DocumentRepositoryImpl
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Service
import org.springframework.web.server.ResponseStatusException

@Service
class DocumentService(private val documentRepository: DocumentRepository, private val documentRepositoryImpl: DocumentRepositoryImpl) {

    fun createDocument(document: Document): Document {
        return documentRepository.save(document)
    }

    fun getDocumentById(id: Long): Document {
        return documentRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "Document with ID $id not found")
        }
    }

    fun updateDocument(id: Long, updatedDocument: Document): Document {
        val existingDocument = documentRepository.findById(id).orElseThrow {
            ResponseStatusException(HttpStatus.NOT_FOUND, "Document with ID $id not found")
        }

        updatedDocument.id = existingDocument.id
        return documentRepository.save(updatedDocument)
    }

    fun deleteDocument(id: Long) {
        if (!documentRepository.existsById(id)) {
            throw ResponseStatusException(HttpStatus.NOT_FOUND, "Document with ID $id not found")
        }
        documentRepository.deleteById(id)
    }

    fun findSavedDocuments(userID: Long): List<Document> {
        return documentRepositoryImpl.findSavedDocuments(userID)
    }

    fun findPostedDocuments(userID: Long): List<Document> {
        return documentRepositoryImpl.findPostedDocuments(userID)
    }

    fun getFeed(): List<Document> {
        return documentRepositoryImpl.getFeed()
    }

}