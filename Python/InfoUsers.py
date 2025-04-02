import os
import cpuinfo as cpu

print("1. Información del SS00 e información del CPU")
print("2. Información y creación de usuarios")
print("3. Identificación y creación de directorios")
print("4. Salir")


opc=0
if os.getuid() == 0:
    while opc != "4":
        opc = input("Introduzca una opción: ")
        match opc:

            case "1":
                print("Mi SSOO es",os.uname().sysname)
                print(cpu.get_cpu_info()["brand_raw"])
                print(" ")
            case "2":
                info = open("/etc/passwd","r")
                cont=info.readlines()
                usu=input("Ingresa el nombre de un usuario ")
                enc=0
                for i in cont:
                    if usu in i:
                        j = os.system("cut -f 1 -d ':' " + i)
                            enc = 1
                            final = i
                            break
                if enc == 1:
                    print(final)
                    print(" ")
                else:
                    print(" ")
                    print("Usuario no encontrado")
                    os.system("useradd "+usu)

            case "3":
                dirc = input("Ingresa el nombre de un directorio")
                if os.path.exists(dirc):
                    if os.path.isdir(dirc):
                        print("El directorio existe")
                else:
                    print("El directorio no existe")
                    os.mkdir(dirc)
                    print(" ")

            case "4":
                print("Gracias por usar nuestro servicios, adios :)")
                print(" ")

            case _:
                print("La opción seleccionada no es valida")

else:
    print(" ")
    print("El usuario no es el root")