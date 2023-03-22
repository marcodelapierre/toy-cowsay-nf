#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.hello = [ 'Bonjour', 'Ciao', 'Hello', 'Hola' ]

process sayHello {
//  arch 'x86_64_v2'
//  spack 'cowsay nano ^ncurses abi=5'
  input:
    val(x)
  output:
    tuple val(x), path('out_hello')
  script:
    """
    echo '$x world!' >out_hello
    """
  stub:
    """
    touch out_hello
    """
}

process cowSay {
//  arch 'x86_64'
//  spack 'cowsay '
  publishDir '.', mode: 'copy', saveAs: { filename -> "out_$x" }
  input:
    tuple val(x), path('out_hello')
  output:
    tuple val(x), path('out_cow')
  script:
    """
    cat out_hello | cowsay 1>out_cow 2>/dev/null || 
    cat out_hello | cowpy  1>out_cow 2>/dev/null
    """
  stub:
   """
   touch out_cow
   """
}

workflow {
  input = Channel.from( params.hello )

  sayHello(input)
  cowSay(sayHello.out)
}

