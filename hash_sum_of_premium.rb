posp_data = {
  posp: [
    { name: 'mahesh', premium: 2500, nops: 4 },
    { name: 'dharya', premium: 3000, nops: 3 },
    { name: 'gowri', premium: 4000, nops: 2 }
  ],
  gst_percent: 18
}
arr = posp_data[:posp]

puts arr.sum { |e| e[:premium] } * 108.to_f / 100
