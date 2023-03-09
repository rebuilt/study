# [Full Stack React](https://www.newline.co/fullstack-react/) 

## Quick Start

### Create react app
Use [create-react-app](https://reactjs.org/docs/create-a-new-react-app.html) to make a new application
Always use npx to make sure it creates the latest version

```bash
npx create-react-app my-app
cd my-app
npm start
```

### Install dependencies

```bash
npm install
```

### Boot dev server

```
npm start
```

### Babel 

Babel transpiles jsx syntax into javascript
```
<script src="vendor/babel-standalone.js"></script>
```

Tell babel to compile jsx syntax
```
<script type="text/babel" 
  data-plugins="transform-class-properties" 
  src="./js/app.js"
></script>
```
