require "rspec"
require "object_mirror"

describe "el algoritmo de method lookup" do
  specify "lala - prueba de ejemplo" do
    mirror = ObjectMirror.pointing_at(1)

    method = mirror.lookup_selector(:+)

    expect(method.call(2)).to eq(1 + 2)
  end
end
