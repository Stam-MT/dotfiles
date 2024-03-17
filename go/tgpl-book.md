
# Go tooling
- "go run file.go" --> compile, link and run (doesn't preserve binary)
- "go build file.go" --> compile and link
- "go fmt" --> runs gofmt on all files in specified package or directory
- "goimports" --> adds and removed import statements (and sorts alphabetically)

# file header
1. comment describing package (main package: write few sentences about program)
2. package <name> --> declares what package this file belongs to. package main --> declares a standalone program (instead of a library)
4. import "name" --> declares used packages

- packages are always referred to by their last directory (e.g. net/http by http.Abc())

# paradigmes
- intervals half-open (i.e. slice[n:m] will return from n to m-1)

# variables
general
- no explicit initialization --> implicit initialization to zero-value
- varname := <value> is short assignment. Type is infered from value
- unused local variables wont compile
- s := ""            (use only within func, not for package-level vars)
- var s string       (initialize with zero value)
- var s = ""         (use for multiple inits in one line)
- var s string = ""  (used when assigned value-type is not the var type (rare))
- mostly use the upper two
- do implicit zero initialization to show that initial value does not matter
- do explicit initialization to show that initial values does matter

strings
- concat by using string1 + string2 OR string1 += string2
- strings.Join(slice, ",") of strings package
- strings.Split(string, ",") of strings package
- byte slice to string: string(byteslice)
- strconv.Itoa(<int>) converts int to string
- strings.HasPrefix(var, "http://")

const (
  size = 5
  freq = 1.3
)
- fixed at compile time
- types allowed: number, string, boolean

# control flow
- classig for loop: "for init; condition; post { ... }"
- any component can be omitted (init, cond, post)
- classic while loop: "for condition { ... }"
- infinite loop: "for { ... }"
- for each: "for index, value := range slice[1:] { ... }"
- break, continue
- if condition { ... }

# functions
- structure: func funcname(paramname paramtype) results {body}
- command line arguments in os.Args[1:] in import "os"
- os.Args[0] will be the program itself

# statements
- ; only needed to seperate multiple statements in one line
- newlines are relevant for code parsing, so something like a \n +b may error

# data types

struct
- groups together fields of different types
- structvar := structtype{field1: val1}
- structvar.field3 = val3

slices
- access element by slice[i]
- access subsequence by slice[m:n]
- get length by len(s)
- slice[1:] defaults to slice[1:len(slice)]
- slice[:7] defaults to slice[0:7]

map
- key value pairs
- key can be any type that is comparable with ==
- mymap := make(map[keytype]valuetype)
- mymap is of type "reference to map"
- insert: mymap[newkey] = val
- range mymap will provide inputs in random order (by design, to prevent relying on a particular order)

# concurrency
goroutines
- is a concurrent function execution
- go myfunction(args, channel)

channels
- is a communcation mechanism that allows one goroutine to pass values to another
- if a goroutine attempts to send data via channel, it blocks until a receive happens
- if a goroutine attempts to receive data via channel, it blocks until a send happens
- ch := make(chan string)
- channel<- write data into channel                                           >
- fmt.Println(<-channel)                                                      >
- myfunction(args, channel chan<- type) { ... }                               >

# standard library

exit
- os.Exit(0)   terminate program with response code 0

print
- fmt.Println("string")
- fmt.Printf("%d %s %t %f", var1, var2, var3, var 4)
- decimal, string, boolean (t = true), float, (many more)

stdin
- import bufio
- scanner := bufif.NewScanner(os.Stdin)   (string iterator line by line)
- scanner.Scan() (iterator returning bool)
- scanner.Text() returns current element

stderr
- fmt.Fprintf(os.Stderr, "text", error_variable)

/dev/null
- ioutil.Discard

io
- io.Copy(dst_stream, src_stream)   copies stream from src to dst, without large buffer

files
- open file, then read line by line:
- file, err := os.Open("filename")   (opens file for reading)
- s := bufio.newScanner(file)
- s.Scan() (see above)
- s.Text() (get line)
- file.Close()
- read file in bulk:
- io/ioutil package
- data,err := ioutil.ReadFile("filename")

random
- import "math/rand"
- rand.Seed(var)
- rand.Float64()   returns value between [0.0,1.0]

network HTTP
- import "net/http"
- handler := func(w http.ResponseWriter, r *http.Request) { ... }
- http.HandleFunc("/", handler)
- http.ListenAndServe("localhost:8000", nil)
- resp, err := http.Get("url")
- binarybody, err := ioutil.ReadAll(resp.Body)
- resp.Body.Close()
- fmt.Printf("%s", binarybody)

time
- starttime := time.Now().UTC().UnixNano()
- time.Since(starttime).Seconds()
