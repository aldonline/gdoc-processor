
Web Service that grabs the HTML version of a (public) Google Doc, extracts some data and rewrites some markup to make it compatible with a Google Doc based blog.

It serves JSON as well as an HTML representation ( the latter is useful for debugging ).

Heuristics are not documented. This is a private service it does not make much sense as a standalone project. I just wrote this README because I have a lot of spare time.

# API

```shell
GET /doc?id={google_doc_id}&format={json|html}

```

---

# Example

```shell
GET /doc?id=1cpctDARTFvfLg-ppd3eOmAXyBwST_A-DWUPKfJ3VyGE&format=json
```
----

```javascript
{
  "title": "Radioactive",
  "subtitle": "A Reactive + Linear Thinking User Interface Framework for Coffeescript",
  "styles": "... CSS ...",
  "image": "https://lh5.googleusercontent.com/ZNggsrptB5u3xoRxJfArzpRhw8AyAC-DHwTAUl7XQjVjkMqTmeRbWvijs0BLLSV51wLk2QzrrJxlr1dEUeDCRIXsx9yS4-Pn6s9oEMhCzLbNotCC8Q",
  "body": "... HTML ...",
  "metadata": {
    "tags": "coffeescript, programming, user interfaces, tutorial, radioactive"
  },
  "summary": "",
  "toc": {
    "href": "#",
    "text": "",
    "children": [
      {
        "href": "#h.lp2lck78mx19",
        "text": "RAML - 100% Coffeescript Markup Language"
      },
      {
        "href": "#h.socjhp7ov06k",
        "text": "Modules"
      },
      {
        "href": "#h.2afzweis5bue",
        "text": "XXX"
      },
      {
        "href": "#h.dse5sw10k4ng",
        "text": "Linear Thinking ( Syncify )",
        "children": [
          {
            "href": "#h.yloiadm6w2ph",
            "text": "And a Table"
          }
        ]
      },
      {
        "href": "#h.qicrww10cx2b",
        "text": "Declarative Programming"
      },
      {
        "href": "#h.zibs2ysnsu6o",
        "text": "History, Inspiration and Similar Frameworks"
      },
      {
        "href": "#h.rzqblnjztqx6",
        "text": "Tools",
        "children": [
          {
            "href": "#h.lf3yhq8ubw1z",
            "text": "Cras mattis consectetur purus sit amet fermentum."
          },
          {
            "href": "#h.c7oocd6apk0q",
            "text": "Cras mattis consectetur purus sit amet fermentum.",
            "children": [
              {
                "href": "#h.59e4r9m7nnyc",
                "text": "Cras mattis consectetur purus sit amet fermentum."
              },
              {
                "href": "#h.hqus1mjs8n19",
                "text": "Cras mattis consectetur purus sit amet fermentum.",
                "children": [
                  {
                    "href": "#h.31xpklgygngy",
                    "text": "Etiam Mattis Mollis"
                  }
                ]
              }
            ]
          },
          {
            "href": "#h.ivtks9ujiora",
            "text": "Inceptos Nullam Quam Nibh"
          }
        ]
      }
    ]
  }
}

```

