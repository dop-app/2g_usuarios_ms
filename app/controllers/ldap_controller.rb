require 'net/ldap'
class LdapController < ApplicationController

    def connect
        ldap = Net::LDAP.new(
            host: 'dop-ldap',
            port: 389,
            auth: {
                method: :simple,
                dn: "cn=admin,dc=arqsoft,dc=unal,dc=edu,dc=co",
                password: "admin"
            }
        )
        return ldap.bind
    end

    def create
        email = params[:email]
        password = params[:password]
        email = email[/\A\w+/].downcase
        if connect()
            ldap = Net::LDAP.new(
                host: 'dop-ldap',
                port: 389,
                auth: {
                    method: :simple,
                    dn: "cn=" + email + "@unal.edu.co, ou=dop,dc=arqsoft,dc=unal,dc=edu,dc=co",
                    password: password
                }
            )
            if ldap.bind
                query = "select * from users where email LIKE '" + email + "@unal.edu.co'"
                results = ActiveRecord::Base.connection.exec_query(query)
                if results.present?
                    @newAuth = ObjAuth.new(email, password, "true")
                    user=User.find_by(email: email+'@unal.edu.co')
                    puts(user.id)
                    token = Knock::AuthToken.new(payload: { sub: user.id }).token
                    puts("Autenticación satisfactoria.")
                    puts(token)                    
                    #render json: {auth: @newAuth,token: token}
                    render json: {auth: @newAuth, token: token, id: user.id}
                else
                    puts("Autenticación no satisfactoria, el usuario no se encuentra registrado en la base de datos.")
                    @newAuth = ObjAuth.new(email, password, "false")
                    render json: {auth: @newAuth}
                end
            else
                puts("Autenticación no satisfactoria, el usuario no se encuentra registrado en el LDAP.")
                @newAuth = ObjAuth.new(email, password, "false")
                render json: {auth: @newAuth}
            end
        end
    end
end

class ObjAuth
    def initialize(email, password, answer)
        @email = email
        @password = password
        @answer = answer
    end
end