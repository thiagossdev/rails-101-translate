require "spec_helper"
require "translate_yandex"

# Teste 1 (Translate)
describe "GET api/v1.5/tr.json/translate (Translate)" do
  it "Api response == 200" do
    text_pt = "Nós estamos testando o tradutor"
    yandex_api = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandex_api.translate text_pt, "en"
    expect(response["code"]).to eq(200)
  end

  it "translated text match" do
    text_pt = "Nós estamos testando o tradutor"
    text_en = "We are testing the translator."
    yandex_api = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandex_api.translate text_pt, "en"

    expect(response["text"].first).to eq(text_en)
  end
end

# Teste 2 (supported list of languages)
describe "GET api/v1.5/tr.json/getLangs (Supported List)" do
  it "Api response not equal nil or empty '' " do
    yandex_api = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandex_api.list
    expect(response).not_to eq(nil)
    expect(response).not_to eq("")
  end
end

# Teste 3 (Language Detect)
describe "GET api/v1.5/tr.json/detect (Detect)" do
  it "Api response == 200" do
    text_pt = "Nós estamos testando o tradutor"
    yandex_api = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandex_api.detect text_pt
    expect(response["code"]).to eq(200)
  end

  it "detect language match with right language" do
    text_pt = "Nós estamos testando o tradutor"
    yandex_api = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandex_api.detect text_pt
    expect(response["lang"]).to eq("pt")
  end
end