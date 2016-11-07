require 'net/http'
print "Digite o Host > "
site = gets.chomp
print "Digite o Diretorio > "
diretorio = gets.chomp
conectando = Net::HTTP.new(site)
resultados , html = conectando.get(diretorio)

if resultados.code == 200
  puts("Codigo 200 = conexao permitida!")
end
if resultados.code == 404
  puts("Codigo 404 = pagina inexistente")
end
