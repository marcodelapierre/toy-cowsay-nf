#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.hello = [ 'Bonjour', 'Ciao', 'Hello', 'Hola' ]

process sayHello {
  input:
    val x
  output:
    path('out_hello')
  script:
    """
    echo '$x world!' >out_hello
    """
}

process cowSay {
  publishDir = '.'
  input:
    path('out_hello')
  output:
    path('out_cow')
  script:
    """
    touch out_cow
    cat out_hello | cowsay 1>/out_cow 2>/dev/null
    cat out_hello | cowpy  1>/out_cow 2>/dev/null
    """
}


workflow {
  input = Channel.from( params.hello )
  sayHello(input)   // | view
  cowSay(input.out)
}

