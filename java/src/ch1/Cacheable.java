package ch1;

public interface Cacheable<T> {
    Value<T> compute();
}
