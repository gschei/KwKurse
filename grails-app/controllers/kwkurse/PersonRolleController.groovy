package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonRolleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PersonRolle.list(params), model:[personRolleInstanceCount: PersonRolle.count()]
    }

    def show(PersonRolle personRolleInstance) {
        respond personRolleInstance
    }

    def create() {
        respond new PersonRolle(params)
    }

    @Transactional
    def save(PersonRolle personRolleInstance) {
        if (personRolleInstance == null) {
            notFound()
            return
        }

        if (personRolleInstance.hasErrors()) {
            respond personRolleInstance.errors, view:'create'
            return
        }

        personRolleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personRolle.label', default: 'PersonRolle'), personRolleInstance.id])
                redirect personRolleInstance
            }
            '*' { respond personRolleInstance, [status: CREATED] }
        }
    }

    def edit(PersonRolle personRolleInstance) {
        respond personRolleInstance
    }

    @Transactional
    def update(PersonRolle personRolleInstance) {
        if (personRolleInstance == null) {
            notFound()
            return
        }

        if (personRolleInstance.hasErrors()) {
            respond personRolleInstance.errors, view:'edit'
            return
        }

        personRolleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PersonRolle.label', default: 'PersonRolle'), personRolleInstance.id])
                redirect personRolleInstance
            }
            '*'{ respond personRolleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PersonRolle personRolleInstance) {

        if (personRolleInstance == null) {
            notFound()
            return
        }

        personRolleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PersonRolle.label', default: 'PersonRolle'), personRolleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personRolle.label', default: 'PersonRolle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
