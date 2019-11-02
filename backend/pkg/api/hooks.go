package api

import (
	"context"

	"github.com/go-chi/chi"
	"github.com/kafka-owl/kafka-owl/pkg/kafka"
)

// Hooks -
type Hooks struct {
	Route RouteHooks
	Topic TopicHooks
}

// RouteHooks -
type RouteHooks interface {
	ConfigPublicRouter(router chi.Router)
	ConfigAPIRouter(router chi.Router)
	ConfigFrontendRouter(router chi.Router)
}

// TopicHooks -
type TopicHooks interface {
	FilterTopics(ctx context.Context, topics []*kafka.TopicDetail)
}

//
// Empty Hooks
//
type emptyHooks struct {
}

func newEmptyHooks() *Hooks {
	empty := &emptyHooks{}
	return &Hooks{
		Route: empty,
		Topic: empty,
	}
}

// Route
func (*emptyHooks) ConfigPublicRouter(router chi.Router)   {}
func (*emptyHooks) ConfigAPIRouter(router chi.Router)      {}
func (*emptyHooks) ConfigFrontendRouter(router chi.Router) {}

// Topic
func (*emptyHooks) FilterTopics(ctx context.Context, topics []*kafka.TopicDetail) {}