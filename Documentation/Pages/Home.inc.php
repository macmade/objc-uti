<div class="xsdoc-file">
    <div class="xsdoc-file-content">
        <h2>Objective-C wrapper for Uniform Type Identifiers (UTIs)</h2>
        <h3>About</h3>
        <p>
            This project consists of an Objective-C wrapper for all the UTI functions available from the LaunchServices framework.
        </p>
        <p>
            The goal is to provide an object-oriented approach to the Uniform Type Identifier system, using Objective-C (Foundation) data types, rather than CoreFoundation types, which may be painful to use, especially with ARC.
        </p>
        <h4>Targets</h4>
        <p>
            The following targets are available:
        </p>
        <ul class="xsdoc-list-square">
            <li>OS X static library (.a).</li>
            <li>OS X dynamic library (.dylib).</li>
            <li>OS X framework (.framework).</li>
            <li>iOS static library (.a).</li>
        </ul>
        <p>
            All targets are available for both ARC and MRC (see below).
        </p>
        <h4>Supported platforms</h4>
        <ul class="xsdoc-list-square">
            <li>OS X deployment target: <strong>OS X 10.6</strong> (ARC - see below), <strong>OS X 10.4</strong> (MRC - see below)</li>
            <li>iOS architectures: <strong>x86_64, i386</strong> (non-ARC - see below)</li>
            <li>iOS deployment target: <strong>iOS 6.0</strong></li>
            <li>iOS architectures: <strong>armv7, armv7s, arm64</strong></li>
        </ul>
        <h4>Automatic Reference Counting (ARC) Note</h4>
        <p>
            All project's targets comes in two flavors.<br />
            One using ARC - Automatic Reference Counting, the other using Manual Reference Counting (MRC).
        </p>
        <p>
            If you're targeting only 64-bits platforms and/or 10.7 deployment targets, you're advised to use the ARC targets.<br />
            Otherwise, if targeting 32-bits platforms and/or deployment targets lower than 10.7, MRC targets are available.
        </p>
        <h3>License</h3>
        <p>
            The project is released under the terms of the MIT License.
        </p>
    </div>
</div>
