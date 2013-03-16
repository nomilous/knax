i = require 'inflection'

module.exports = Knax =

    load: (definition) ->

        unless typeof definition.category == 'undefined'

            directory = i.pluralize definition.category

            console.log directory

            unless definition.class 

                throw 'local plugin requires category and class'

            try

                module = "./#{directory}/#{definition.class}"
                return require module

            catch error

                if error.code == 'MODULE_NOT_FOUND'

                    return Knax.loadNested definition, error

                throw error


    loadNested: (definition, error) ->

        console.log 'TODO: loadNested'
        throw error
