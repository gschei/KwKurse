package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InteressentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Interessent.list(params), model:[interessentInstanceCount: Interessent.count()]
    }

    def show(Interessent interessentInstance) {
        respond interessentInstance
    }

    def create() {
        respond new Interessent(params)
    }

    @Transactional
    def save(Interessent interessentInstance) {
        if (interessentInstance == null) {
            notFound()
            return
        }

        if (interessentInstance.hasErrors()) {
            respond interessentInstance.errors, view:'create'
            return
        }

        interessentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interessent.label', default: 'Interessent'), interessentInstance.id])
                redirect interessentInstance
            }
            '*' { respond interessentInstance, [status: CREATED] }
        }
    }

    def edit(Interessent interessentInstance) {
        respond interessentInstance
    }

    @Transactional
    def update(Interessent interessentInstance) {
        if (interessentInstance == null) {
            notFound()
            return
        }

        if (interessentInstance.hasErrors()) {
            respond interessentInstance.errors, view:'edit'
            return
        }

        interessentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Interessent.label', default: 'Interessent'), interessentInstance.id])
                redirect interessentInstance
            }
            '*'{ respond interessentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Interessent interessentInstance) {

        if (interessentInstance == null) {
            notFound()
            return
        }

        interessentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Interessent.label', default: 'Interessent'), interessentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interessent.label', default: 'Interessent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
