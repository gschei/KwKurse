package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KursTerminController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond KursTermin.list(params), model:[kursTerminInstanceCount: KursTermin.count()]
    }

    def show(KursTermin kursTerminInstance) {
        respond kursTerminInstance
    }

    def create() {
        respond new KursTermin(params)
    }

    @Transactional
    def save(KursTermin kursTerminInstance) {
        if (kursTerminInstance == null) {
            notFound()
            return
        }

        if (kursTerminInstance.hasErrors()) {
            respond kursTerminInstance.errors, view:'create'
            return
        }

        kursTerminInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'kursTermin.label', default: 'KursTermin'), kursTerminInstance.id])
                redirect kursTerminInstance
            }
            '*' { respond kursTerminInstance, [status: CREATED] }
        }
    }

    def edit(KursTermin kursTerminInstance) {
        respond kursTerminInstance
    }

    @Transactional
    def update(KursTermin kursTerminInstance) {
        if (kursTerminInstance == null) {
            notFound()
            return
        }

        if (kursTerminInstance.hasErrors()) {
            respond kursTerminInstance.errors, view:'edit'
            return
        }

        kursTerminInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'KursTermin.label', default: 'KursTermin'), kursTerminInstance.id])
                redirect kursTerminInstance
            }
            '*'{ respond kursTerminInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(KursTermin kursTerminInstance) {

        if (kursTerminInstance == null) {
            notFound()
            return
        }

        kursTerminInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'KursTermin.label', default: 'KursTermin'), kursTerminInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'kursTermin.label', default: 'KursTermin'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
