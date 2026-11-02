# Zap Imóveis Ad API – Ruby example (stdlib only)
# Usage: PILOTERR_API_KEY=your-key ruby ad.rb
require "json"
require "net/http"
require "uri"

uri = URI("https://api.piloterr.com/v2/zapimoveis/ad")
uri.query = URI.encode_www_form('query' => 'https://www.zapimoveis.com.br/imovel/venda-apartamento-3-quartos-mobiliado-jardim-paulista-zona-sul-sao-paulo-sp-170m2-id-2912096343/')

request = Net::HTTP::Get.new(uri)
request["x-api-key"] = ENV.fetch("PILOTERR_API_KEY")

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, read_timeout: 120) do |http|
  http.request(request)
end

abort "Piloterr error #{response.code}: #{response.body}" unless response.is_a?(Net::HTTPSuccess)

puts JSON.pretty_generate(JSON.parse(response.body))
