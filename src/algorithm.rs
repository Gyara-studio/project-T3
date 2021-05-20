pub(crate) fn solve(mut input: Vec<String>) -> String {
    let len = input.len();
    if len > 6 {
        input = input.get(len - 6..len).unwrap().to_owned();
    }
    vec!["00", "01", "02", "10", "11", "12", "20", "21", "22"]
        .into_iter()
        .map(|s| s.to_string())
        .find(|s| !input.contains(s))
        .unwrap()
}
