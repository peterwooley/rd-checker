# Reconcilable Differences Secret Episode Checker
If you're too excited to wait for the new episode of [Reconcilable Differences](https://www.relay.fm/rd) to show up on Thursday morning, run this script to see if it's available before the feed is updated. You might [make Merlin's day](https://twitter.com/hotdogsladies/status/748340960304586754).

## Installation & Usage
```sh
git clone https://github.com/peterwooley/rd-checker.git
cd rd-checker
chmod +x rd-checker.pl
./rd-checker.pl

# If you're lucky, it'll print:
# Episode 42 has been uploaded early. Listen at <url>

# If you're not so lucky, it'll print:
# Episode 42 has not been uploaded yet.
```

## A Note on Implementation
While I spend most of my time writing JavaScript, this was written in Perl as an homage to John Siracusa. Turns out, Perl is a lot of fun.
