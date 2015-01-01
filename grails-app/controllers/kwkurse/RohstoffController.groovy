package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RohstoffController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rohstoff.list(params), model:[rohstoffInstanceCount: Rohstoff.count()]
    }

    def show(Rohstoff rohstoffInstance) {
        respond rohstoffInstance
    }

    def create() {
        respond new Rohstoff(params)
    }

    @Transactional
    def save(Rohstoff rohstoffInstance) {
        if (rohstoffInstance == null) {
            notFound()
            return
        }

        if (rohstoffInstance.hasErrors()) {
            respond rohstoffInstance.errors, view:'create'
            return
        }

        rohstoffInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rohstoff.label', default: 'Rohstoff'), rohstoffInstance.id])
                redirect rohstoffInstance
            }
            '*' { respond rohstoffInstance, [status: CREATED] }
        }
    }

    def edit(Rohstoff rohstoffInstance) {
        respond rohstoffInstance
    }

    @Transactional
    def update(Rohstoff rohstoffInstance) {
        if (rohstoffInstance == null) {
            notFound()
            return
        }

        if (rohstoffInstance.hasErrors()) {
            respond rohstoffInstance.errors, view:'edit'
            return
        }

        rohstoffInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Rohstoff.label', default: 'Rohstoff'), rohstoffInstance.id])
                redirect rohstoffInstance
            }
            '*'{ respond rohstoffInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Rohstoff rohstoffInstance) {

        if (rohstoffInstance == null) {
            notFound()
            return
        }

        rohstoffInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Rohstoff.label', default: 'Rohstoff'), rohstoffInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rohstoff.label', default: 'Rohstoff'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
