## SPF Counter

Let's count how many DNS lookups various SPF records require.

Ten or less is `GOOD`. More than ten is `FAIL`. MX and A don't count.

### Setup

```bash
gem install spf-query
```

### Usage

```bash
./spf_counter.rb yourdomain.com
#=> yourdomain.com, 8, PASS
```
