package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KursTeilnahmeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond KursTeilnahme.list(params), model:[kursTeilnahmeInstanceCount: KursTeilnahme.count()]
    }

    def show(KursTeilnahme kursTeilnahmeInstance) {
        respond kursTeilnahmeInstance
    }

    def create() {
        respond new KursTeilnahme(params)
    }

    @Transactional
    def save(KursTeilnahme kursTeilnahmeInstance) {
        if (kursTeilnahmeInstance == null) {
            notFound()
            return
        }

        if (kursTeilnahmeInstance.hasErrors()) {
            respond kursTeilnahmeInstance.errors, view:'create'
            return
        }

        kursTeilnahmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'kursTeilnahme.label', default: 'KursTeilnahme'), kursTeilnahmeInstance.id])
                redirect kursTeilnahmeInstance
            }
            '*' { respond kursTeilnahmeInstance, [status: CREATED] }
        }
    }

    def edit(KursTeilnahme kursTeilnahmeInstance) {
        respond kursTeilnahmeInstance
    }

    @Transactional
    def update(KursTeilnahme kursTeilnahmeInstance) {
        if (kursTeilnahmeInstance == null) {
            notFound()
            return
        }

        if (kursTeilnahmeInstance.hasErrors()) {
            respond kursTeilnahmeInstance.errors, view:'edit'
            return
        }

        kursTeilnahmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'KursTeilnahme.label', default: 'KursTeilnahme'), kursTeilnahmeInstance.id])
                redirect kursTeilnahmeInstance
            }
            '*'{ respond kursTeilnahmeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(KursTeilnahme kursTeilnahmeInstance) {

        if (kursTeilnahmeInstance == null) {
            notFound()
            return
        }

        kursTeilnahmeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'KursTeilnahme.label', default: 'KursTeilnahme'), kursTeilnahmeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'kursTeilnahme.label', default: 'KursTeilnahme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
